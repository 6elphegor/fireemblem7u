	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D4AC
sub_0803D4AC: @ 0x0803D4AC
	push {lr}
	sub sp, #4
	ldr r1, _0803D4E8 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0803D4EC @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803D4F0 @ =0x030013DA
	ldr r0, _0803D4F4 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803D4F8 @ =0x030013E0
	ldr r2, _0803D4FC @ =0x030013E8
	movs r1, #3
_0803D4D4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D4D4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803D4E8: .4byte 0x00007FFF
_0803D4EC: .4byte 0x08B98AEC
_0803D4F0: .4byte 0x030013DA
_0803D4F4: .4byte 0x030013D8
_0803D4F8: .4byte 0x030013E0
_0803D4FC: .4byte 0x030013E8
