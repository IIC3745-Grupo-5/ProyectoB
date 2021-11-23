import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import Seat from './seat';
import { rows, columns, seats, initialSeatState } from '../constants';


const Room = (props) => {
  const { roomName } = props;
  const [selectedSeats, setSelectedSeats] = useState([]);
  const [seatStatus, setSeatStatus] = useState(initialSeatState);

  const selectSeat = (room, letter, number) => {
    if (selectedSeats.length && !selectedSeats[0].includes(letter)) {
      setSeatStatus(initialSeatState);
      setSelectedSeats([]);
    } else {
      const letterIndex = rows.indexOf(letter);
      const numberIndex = columns.indexOf(number);
      setSeatStatus((prevState) => {
        const stateCopy = prevState.map((row) => row.slice());
        stateCopy[letterIndex][numberIndex] = !selectedSeats.includes(room);
        return stateCopy;
      });
      if (selectedSeats.includes(room)) {
        setSelectedSeats((prevState) => prevState.filter((elem) => elem !== room));
      } else {
        setSelectedSeats((prevState) => [...prevState, room]);
      }
    };
  };

  useEffect(() => {
    // Get all reservations and check which are occupied
  }, []);

  return (
    <>
      <h1 className="room-seats-title">Seats for {roomName}</h1>
      <div className="seats-container">
        <div className="upper-container">
          <div className="left-corridor">
            <p>LEFT AISLE</p>
          </div>
          <div className="seats-section">
            {seats.map((row, l_index) => row.map((seat, n_index) => <Seat key={seat} name={seat} isOccupied={seatStatus[l_index][n_index]} selectSeat={selectSeat} />))}
          </div>
          <div className="right-corridor">
            <p>RIGHT AISLE</p>
          </div>
        </div>
        <div className="screen">
          <p>SCREEN</p>
        </div>
      </div>
    </>
  );
};


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Room />,
    document.body.appendChild(document.createElement('div')),
  )
});
