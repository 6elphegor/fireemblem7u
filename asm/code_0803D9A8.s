	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPollingMsgAndAck
SioPollingMsgAndAck: @ 0x0803D9A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0803D9EC @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl SioPollingMsg
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _0803D9E4
	ldr r4, _0803D9F0 @ =0x08B98AEC
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl GetSioIndex
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl Proc_Break
_0803D9E4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D9EC: .4byte 0x00002586
_0803D9F0: .4byte 0x08B98AEC
