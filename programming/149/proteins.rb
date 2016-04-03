class InvalidCodonError < StandardError; end

class Translation
  TRANSLATOR = { "AUG" => "Methionine", 
                  "UUU" => "Phenylalanine", 
                  "UUC" => "Phenylalanine", 
                  "UUA" => "Leucine", 
                  "UUG" => "Leucine", 
                  "UCU" => "Serine", 
                  "UCC" => "Serine", 
                  "UCA" => "Serine", 
                  "UCG" => "Serine", 
                  "UAU" => "Tyrosine", 
                  "UAC" => "Tyrosine", 
                  "UGU" => "Cysteine" , 
                  "UGC" => "Cysteine", 
                  "UGG" => "Tryptophan", 
                  "UAA" => "STOP", 
                  "UAG" => "STOP", 
                  "UGA" => "STOP" }

  def self.of_codon(string)
    TRANSLATOR[string]
  end
  
  def self.of_rna(strand)
    protein_array = []
    while strand.length > 0
      raise InvalidCodonError unless TRANSLATOR.keys.include?(strand.slice(0..2))
      break if TRANSLATOR[strand.slice(0..2)] == "STOP"
      protein_array.push(TRANSLATOR[strand.slice!(0..2)])
    end

    protein_array
  end
end
