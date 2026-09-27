	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_Loop_B
QuintessenceFx_Loop_B: @ 0x0807C1B8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807C204 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0xa
	bne _0807C1FE
	adds r0, r4, #0
	bl Proc_Break
_0807C1FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte 0x03002870
