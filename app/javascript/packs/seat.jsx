import React, { useState } from 'react';

const Seat = ({ name, isOccupied, selectSeat }) => {
  // const [occupied, setOccupied] = useState(isOccupied);
  const [letter] = useState(name.replace(/[^a-z]/gi, ''));
  const [number] = useState(Number(name.replace( /^\D+/g, '')));

  const handleClick = () => {
    // !isOccupied && setOccupied(!occupied);
    selectSeat(name, letter, number);
  };

  return (
    <div className={`grid-item ${isOccupied ? "taken" : "empty"}`} onClick={handleClick}>
      <p>{name}</p>
    </div>
  );
};

export default Seat;
