require 'pry'

class LinkedList
  attr_accessor :name, :nodes, :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @nodes = 0
  end

  def append(value)
    if @head == nil
      prepend(value)
      @tail = @head
    else
      temp_node = @head
      temp_node = temp_node.next until temp_node.next.nil?
      @tail = Node.new(value)
      temp_node.next = @tail
      @nodes += 1
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @nodes += 1
  end

  def size
    nodes
  end

  def at(index)
    i = 0
    temp_node = @head
    until i == index
      temp_node = temp_node.next
      i+=1
    end
    temp_node
  end   

  def pop
    cur = @head
    prev = nil
    until cur.next.nil?
      prev = cur
      cur = cur.next
    end
    prev.next = nil
    @tail = prev
    @nodes -= 1
    cur
  end

  def contains?(value)
    temp = @head
    until temp.next.nil?
      return true if temp.value == value

      temp = temp.next
    end
    if temp.value == value
      true
    else
      false
    end  
  end

  def find(value)
    index = 0
    temp = @head
    until temp.next.nil?
      return index if temp.value == value
      
      temp = temp.next
      index += 1
    end
    if temp.value == value
      return index
    else
      return nil
    end
  end

  def to_s
    values = [@head.value]
    temp = @head
    until temp.next.nil?
      temp = temp.next
      values.push(temp.value)
    end
    valueStr = values.map{|data| "( #{data} )" }
    return(valueStr.join(' -> ') +' -> nil')
  end 

  def insert_at(value, index)
    node = 0
    if index == 0
      prepend(value)
      return
    elsif index > @nodes-1
      append(value)
      return
    end

    cur = @head   
    prev = nil

    until node == index
      prev = cur
      cur = cur.next
      node += 1
    end
    prev.next = Node.new(value,cur)
    @nodes += 1

  end

  def remove_at(index)
    node = 0
    if index == 0
      @head = @head.next
      return
    elsif index > @nodes-1
      pop()
      return
    else
      cur = @head
      prev = nil
      until index == node
        prev = cur
        cur = cur.next
        node += 1
      end
      fut = cur.next
      prev.next = fut
      @nodes -= 1
    end
  end

end

class Node
  attr_accessor :value, :next
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

