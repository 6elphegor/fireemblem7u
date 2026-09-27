	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802FA6C
sub_0802FA6C: @ 0x0802FA6C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802FA90 @ =0x0203A470
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _0802FA94 @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802FA8C
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802FA8C:
	pop {r0}
	bx r0
	.align 2, 0
_0802FA90: .4byte 0x0203A470
_0802FA94: .4byte 0x0203A3F0
