module mealy_11011(  
input wire clk,
input wire rstn,
input wire din,
output reg dout);
// state encoding
reg [2:0] current_state, next_state;
localparam [2:0] Idle_S11011 = 3'b000,  // its non overlapp once full detected goes to idle state
                      S1 = 3'b001,
							 S11 = 3'b010,
							 S110= 3'b011,
							 S1101=3'b100;
//state transition current to next state
always @(posedge clk or negedge rstn) begin
if(!rstn) 
current_state <= Idle_S11011;
else
current_state <= next_state;
end
 
//next state and output logic
always @(*) begin
next_state = Idle_S11011;
dout = 1'b0;
case ( current_state) 
 Idle_S11011 :begin next_state = din ? S1 : Idle_S11011;
 dout = 1'b0; end
 S1 : begin next_state = din ? S11 : Idle_S11011;
 dout =1'b0; 
 end
 S11 : begin next_state = din ? S11 : S110;
 dout = 1'b0;
 end
 S110 : begin next_state = din ? S1101 : Idle_S11011;
 dout =1'b0;
 end
 S1101 : begin 
       if (din) begin
       next_state = Idle_S11011;
       dout = 1'b1; end
		 else begin
		 next_state = Idle_S11011;
       dout = 1'b0; end
		 end
endcase
end

endmodule
		 
 