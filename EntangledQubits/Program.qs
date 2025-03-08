namespace EntangledQubits {

    import Microsoft.Quantum.Diagnostics.*;

    operation Main() : (Result, Result) {
        // Allocate two qubits, q1 and q2, in the |0⟩ state
        use (q1, q2) = (Qubit(), Qubit());

        // Put q1 into an even superposition of |0⟩ and |1⟩
        // It now has a 50% chance of being measured as |0⟩ and a 50% chance of being measured as |1⟩
        H(q1);

        // Entangle q1 and q2, making q1 the control and q2 the target. q2 depends on q1.
        CNOT(q1, q2);

        // Show the entangled state of the qubits
        DumpMachine();

        // Measure q1 and q2 and store the results in m1 and m2.
        let (m1, m2) = (M(q1), M(q2));

        // Reset q1 and q2 to the |0⟩ state
        Reset(q1);
        Reset(q2);

        // Return the measurement results
        return (m1, m2);
    }
}

