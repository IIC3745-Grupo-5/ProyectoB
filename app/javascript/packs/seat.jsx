import React, { useState } from 'react';

const Seat = ({ name, isOccupied, selectSeat }) => {
  const [letter] = useState(name.replace(/[^a-z]/gi, ''));
  const [number] = useState(Number(name.replace( /^\D+/g, '')));

  const handleClick = () => {
    selectSeat(name, letter, number);
  };

  return (
    <div id={name} className={`grid-item ${isOccupied}`} onClick={handleClick}>
      <p>{name}</p>
    </div>
  );
};

export default Seat;
