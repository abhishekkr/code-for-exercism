use Bitwise

defmodule SecretHandshake do
  @code10000 "REVERSE"
  @code1000  "jump"
  @code100   "close your eyes"
  @code10    "double blink"
  @code1     "wink"

  @doc """
  Reverses order of elements in given list
  """
  @spec commands(code :: list(String.t())) :: list(String.t())
  def reverse_list([]), do: []
  def reverse_list([head | tail]), do: reverse_list(tail) ++ [head]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: do_commands(code, [])
  def do_commands(code , handshake) when code === 0 do
    if List.last(handshake) === @code10000 do
      handshake
      |> List.delete(@code10000)
      |> reverse_list
    else
      handshake
    end
  end
  def do_commands(code , handshake) when code === 0 do
    handshake
  end
  def do_commands(code, handshake) when Bitwise.bor(code, 0b10000) === code do
    Bitwise.bxor(code, 0b10000)
    |> do_commands([@code10000] ++ handshake)
  end
  def do_commands(code, handshake) when Bitwise.bor(code, 0b1000) === code do
    Bitwise.bxor(code, 0b1000)
    |> do_commands(([@code1000] ++ handshake))
  end
  def do_commands(code, handshake) when Bitwise.bor(code, 0b100) === code do
    Bitwise.bxor(code, 0b100)
    |> do_commands(([@code100] ++ handshake))
  end
  def do_commands(code, handshake) when Bitwise.bor(code, 0b10) === code do
    Bitwise.bxor(code, 0b10)
    |> do_commands(([@code10] ++ handshake))
  end
  def do_commands(code, handshake) when Bitwise.bor(code, 0b1) === code do
    Bitwise.bxor(code, 0b1)
    |> do_commands(([@code1] ++ handshake))
  end
  def do_commands(_, _) do
    []
  end
end
