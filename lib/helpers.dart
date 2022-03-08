String greeting(){

  var timeNow = DateTime.now().hour;

  if (timeNow < 12) {
    return 'Morning';
  } else if ((timeNow >= 12) && (timeNow < 18)) {
    return 'Afternoon';
  } else if ((timeNow >= 18) && (timeNow < 24)) {
    return 'Evening';
  } else {
    return 'Hello';
  }
}