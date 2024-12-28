const Client = require("@googlemaps/google-maps-services-js").Client;
const axios = require("../axios/index");
const fetch = require("node-fetch");
const configs = require("../../configs/maps/index");
class CustomClient {
  constructor(apiKey) {
    this.apiKey = apiKey;
    this.internalClient = new Client({}); // Create an empty client
  }

  async distanceMatrix(options) {
    const url = new URL(
      "https://maps.googleapis.com/maps/api/distancematrix/json"
    );
    url.searchParams.append("origins", options.origins.join("|"));
    url.searchParams.append("destinations", options.destinations.join("|"));
    url.searchParams.append("travelMode", options.travelMode || "driving");
    url.searchParams.append("unitSystem", options.unitSystem || "metric");
    url.searchParams.append("key", this.apiKey);
    try {
      const response = await fetch(url.toString());

      if (!response.ok) {
        throw new Error(
          `Error fetching distance matrix data: ${response.status}`
        );
      }

      const data = await response.json();

      // Delegate parsing logic to internal client (if necessary)
      // ...

      return data;
    } catch (error) {
      console.error("Error:", error);
      throw error; // Re-throw the error for further handling
    }
  }

  // Implement similar methods for other functionalities you need (geocode, etc.)

  // Example implementation for geocode
  async geocode(latitude, longitude) {
    // Validate input for latitude and longitude
    if (isNaN(latitude) || isNaN(longitude)) {
      throw new Error("Invalid input: Latitude and longitude must be numbers.");
    }

    const url = new URL("https://maps.googleapis.com/maps/api/geocode/json");
    url.searchParams.append(
      "latlng",
      `<span class="math-inline">\{latitude\},</span>{longitude}`
    );
    url.searchParams.append("key", this.apiKey);

    try {
      const response = await fetch(url.toString());

      if (!response.ok) {
        throw new Error(`Error fetching geocode data: ${response.status}`);
      }

      const data = await response.json();

      if (data.status !== "OK") {
        throw new Error(
          `Error: Google Maps API returned error status: ${data.status}`
        );
      }

      // Assuming the first address component is the most relevant
      const address = data.results[0].formatted_address;
      return address;
    } catch (error) {}
  }
  async getRoute(pointA, pointB, travelMode = "driving") {
    // Validate input points
    if (
      !pointA ||
      !pointA.latitude ||
      !pointA.longitude ||
      !pointB ||
      !pointB.latitude ||
      !pointB.longitude
    ) {
      throw new Error(
        "Invalid input: Points must be objects with latitude and longitude properties."
      );
    }

    const origin = `${pointA.latitude},${pointA.longitude}`;
    const destination = `${pointB.latitude},${pointB.longitude}`;

    const url = new URL("https://maps.googleapis.com/maps/api/directions/json");
    url.searchParams.append("origin", origin);
    url.searchParams.append("destination", destination);
    url.searchParams.append("travelMode", travelMode);
    url.searchParams.append("key", this.apiKey);

    try {
      const response = await fetch(url.toString());

      if (!response.ok) {
        throw new Error(`Error fetching route data: ${response.status}`);
      }

      const data = await response.json();

      if (data.status !== "OK") {
        throw new Error(
          `Error: Google Maps API returned error status: ${data.status}`
        );
      }

      const route = data.routes[0]; // Assuming the first route is desired
      const legs = route.legs;

      if (legs.length === 0) {
        throw new Error("No route found between the provided points.");
      }

      const distanceInMeters = legs[0].distance.value;
      const distanceInKms = distanceInMeters / 1000;

      return {
        distanceInKms, // Distance in kilometers
        travelMode, // Travel mode used (driving, bicycling, etc.)
        // Optionally include other route data if needed (e.g., points, duration)
      };
    } catch (error) {
      console.error("Error:", error.message);
      throw error;
    }
  }

  // Function to decode polyline (replace with your preferred implementation)
  async decodePolyline(encodedPoints) {
    // Implement a function to decode the polyline into an array of latitude-longitude pairs
    // You can find many libraries or online tools that provide this functionality.
    // This example doesn't include a specific implementation for brevity.
    console.warn(
      "Polyline decoding not implemented. Please provide a decodePolyline function."
    );
    return [];
  }

  async getAddress(lat, lon) {
    let result = await axios.get(
      `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lon}&key="AIzaSyChzOQofZVtnlA_g-ekWp5CLnUt2m7yUrw"
     `,
      "",
      ""
    );
    return result;
  }
}

// Usage example (assuming you've stored your API key in an environment variable named 'GOOGLE_MAPS_API_KEY')
const apiKey = configs.apiKey;
const client = new CustomClient(apiKey);
module.exports = client;
