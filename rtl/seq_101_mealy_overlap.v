module seq_101_mealy_overlap(
input wire clk,
input wire rstn,
input wire din,
output reg dout);
// state encoding  using local parameter so as compare to parameter it cant be overwritten in instantiation
localparam [1:0] Idle_S101 =2'b00,
                  S1 = 2'b01,
                 S10 =2'b10;
reg [1:0] current_state,next_state;
//state transistion logic current state
always @(posedge clk or negedge rstn)  begin 
 if(!rstn)
  current_state <= Idle_S101;
  else
  current_state <= next_state;
end
//next state & output logic
always @(*) begin
dout = 1'b0;
next_state = Idle_S101;
case (current_state)
Idle_S101 : begin next_state = din ? S1 : Idle_S101; //if at idle state 1 detect go to s1  
              dout = 1'b0; end
S1 : begin next_state = din ? S1 : S10 ; //if at s1 1 already detected now if 0 detect go to s10 otherwise if 1 stay in s1
              dout = 1'b0; end
S10 : begin 
   if (din) begin
   dout = 1'b1;
   next_state =  S1; //in both case go to idle either 101 or 100 
   end
   else begin
   dout=1'b0;
   next_state = Idle_S101;
   end
   end
endcase
end
endmodule
