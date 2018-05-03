-- Originaly created by MLJWare and modfied by Adrmial Enigma

--- Manages states, by treating them as a stack (i.e. first-in, last-out).
local StateManager = {}

-- a table used as a stack to store the states in.
local _stateStack = {}

--- Pushes a new state on top of the stack, making it the current state.
function StateManager:push(stateId)
  local state = require(stateId)
  table.insert(_stateStack, state)
  self:tryInvoke("init")
end

--- Pops the top of the stack, making the state below it the current state.
function StateManager:pop()
  return table.remove(_stateStack)
end

--- Returns the currently active state (if it exists).
function StateManager:top()
  return _stateStack[#_stateStack]
end

--- Returns a state based on its offset from the top (if it exists).
-- @param offset
--    the offset to find the state at (as an non-positive integer)
-- @return the state at the given offset (or `nil` if the state doesn't exist).
function StateManager:get(offset)
  return _stateStack[#_stateStack + offset]
end

--- Tries to invoke a method on the currently active state.
-- @param methodName
--    the name of the method to invoke (as a string)
-- @param ...
--    additional arguments to pass to the method
-- @return
--    the result of invoking the method (or `nil` if the method isn't found).
function StateManager:tryInvoke(methodName, ...)
  local currentState = self:top()
  if not currentState then return end

  local method = currentState[methodName]
  if not method then return end

  return method(currentState, ...)
end

return StateManager
