require "./lib/caesar_cipher.rb"

describe "#caesar_cipher" do
  it "returns a string shifted by the given value" do
    expect(caesar_cipher("a", 2)).to eql("c")
  end

  it "wraps around the alphabet" do
    expect(caesar_cipher("z", 2)).to eql("b")
  end

  it "can handle multiples greater than 25" do
    expect(caesar_cipher("z", 27)).to eql("a")
  end

  it "ignores characters that are not letters" do
    expect(caesar_cipher("abc!?1", 2)).to eql("cde!?1")
  end

  it "recognizes uppercase letters" do
    expect(caesar_cipher("Abc", 2)).to eql("Cde")
  end
end
