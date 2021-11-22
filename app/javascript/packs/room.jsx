import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import Seat from './seat';

const rows = ['A', 'B', 'C', 'D'];
const columns = [1, 2, 3, 4, 5, 6, 7, 8, 9,  10, 11, 12];
const seats = rows.map((row) => columns.map((column) => `${row}${column}`));


const Room = (props) => {
  const { roomName } = props;

  useEffect(() => {
    // Get all reservations and check which are occupied
  }, []);

  return (
    <div className="seats-container">
      <h1>Seats for {roomName}</h1>
      <div className="left-corridor"></div>
      {seats.map((row) => row.map((seat) => <Seat name={seat} isOccupied={false} />))}
      <div className="right-corridor"></div>
      <div className="screen"></div>
    </div>
  );
};


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Room />,
    document.body.appendChild(document.createElement('div')),
  )
});
