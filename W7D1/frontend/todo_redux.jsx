import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { applyMiddleware } from 'redux';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState, applyMiddleware);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  const dispatch = store.dispatch;
  console.log("state pre-dispatched: ", store.getState());
  console.log("action:", action);
  let returnValue = dispatch(action);
  console.log("state after-dispatched: ",store.getState());
  return returnValue;
};
