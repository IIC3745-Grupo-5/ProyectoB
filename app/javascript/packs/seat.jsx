import React, { useState } from 'react';

const Seat = ({ name, isOccupied }) => {
  const [occupied, setOccupied] = useState(isOccupied);

  const handleClick = () => {
    !isOccupied && setOccupied(!occupied);
  };

  return (
    <div className={`grid-item ${occupied ? "taken" : "empty"}`} onClick={handleClick}>
      <p>{name}</p>
    </div>
  );
};

export default Seat;
