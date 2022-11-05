const axios = require("axios");
require("dotenv");

const baseUrl = http://localhost:8080/api/fitness/heartratevar;

const getMyHeartRate = async (userId, date) => {
  try {
    const myHrData = await axios.get(
      "http://localhost:8080/api/fitness/heartrate"
    );
    return myHrData;
  } catch (error) {
    console.log("Something wrong with myApi");
    console.log(error);
  }
};

const getMyBreathingRate = async (userId, date) => {
  try {
    const myBreathingRate = await axios.get(
      "http://localhost:8080/api/fitness/breathrate"
    );
    return myBreathingRate;
  } catch (error) {}
};

const getMyActivity = async(userId,date)=>{
    try {
        const myActivity = await axios.get("http://localhost:8080/api/fitness/activity");
        return myActivity;
    } catch (error) {
        
    }
}

const getMyheartRateVar = async(userId,date)=>{
    try {
        const myHrvData = await axios.get("http://localhost:8080/api/fitness/heartratevar");
        return myHrvData;
    } catch (error) {
        
    }
}

const getMyWater = async(userId,date)=>{
    try {
        const myWaterLog = await axios.get("http://localhost:8080/api/fitness/water");
        return myWaterLog;
    } catch (error) {
        
    }
}