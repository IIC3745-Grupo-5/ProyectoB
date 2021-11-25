import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import Seat from './seat';
import { rows, columns, seats, initialSeatState } from '../constants';


const Room = (props) => {
  let { roomData, prevReservations } = props;
  prevReservations = JSON.parse(prevReservations);
  roomData = JSON.parse(roomData);
  const roomName = roomData.name;
  const [selectedSeats, setSelectedSeats] = useState([]);
  const [seatStatus, setSeatStatus] = useState(initialSeatState);

  const reservedSeats = []
  prevReservations.forEach((reservation) => {
    reservation.seats.forEach((seat) => reservedSeats.push(seat))
  })

  const setPrevReserved = () => {
    reservedSeats.map((seat) => {
      const letter = seat.replace(/[^a-z]/gi, '');
      const number = Number(seat.replace( /^\D+/g, ''))
      const letterIndex = rows.indexOf(letter);
      const numberIndex = columns.indexOf(number);
      setSeatStatus((prevState) => {
        const stateCopy = prevState.map((row) => row.slice());
        stateCopy[letterIndex][numberIndex] = !selectedSeats.includes(seat);
        return stateCopy;
      });
    })
  }

  const selectSeat = (seat, letter, number) => {
    if (selectedSeats.length && !selectedSeats[0].includes(letter)) {
      setSeatStatus(initialSeatState);
      setSelectedSeats([]);
    } else {
      const letterIndex = rows.indexOf(letter);
      const numberIndex = columns.indexOf(number);
      setSeatStatus((prevState) => {
        const stateCopy = prevState.map((row) => row.slice());
        stateCopy[letterIndex][numberIndex] = !selectedSeats.includes(seat);
        return stateCopy;
      });
      if (selectedSeats.includes(seat)) {
        setSelectedSeats((prevState) => prevState.filter((elem) => elem !== seat));
      } else {
        setSelectedSeats((prevState) => [...prevState, seat]);
      }
    };
  };

  useEffect(() => {
    // Get all reservations and check which are occupied
    setPrevReserved()
  }, []);

  const makeReservation = () => {
    const data = {
      seats: selectedSeats,
      room: roomData
    }
    fetch("http://localhost:3000/reservations/", { 
      method: "post",
      body: JSON.stringify(data)
    })
      .then((response) => response.json())
      .then((data) => window.location.href = data.redirect_url)
  }

  return (
    <div className="room-hero">
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
      <button className="reserve-btn" onClick={makeReservation}>
        Make reservation
      </button>
    </div>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('room_data')
  const data = node.getAttribute('data')
  const prevReservations = node.getAttribute('reservations')
  ReactDOM.render(
    <Room roomData={data} prevReservations={prevReservations} />,
    document.body.appendChild(document.createElement('div')),
  )
});
