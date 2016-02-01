/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.view.sm {

public class StateMachineImpl implements StateMachine {

	private var _currentState			:State 		= null;

	public function changeState(state:State):void
	{
		if(_currentState)
			_currentState.exit();

		_currentState = state;

		if (_currentState)
			_currentState.enter();
	}

}
}
