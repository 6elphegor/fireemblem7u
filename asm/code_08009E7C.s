	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkOpen
StartTalkOpen: @ 0x08009E7C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08009ED8 @ =0x08B90B9C
	bl Proc_StartBlocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetTalkFaceHPos
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08009EDC @ =0x08B909B8
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08009EBC
	movs r0, #0
	strh r0, [r2]
_08009EBC:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _08009EC8
	movs r0, #0x1e
	strh r0, [r2]
_08009EC8:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009ED8: .4byte 0x08B90B9C
_08009EDC: .4byte 0x08B909B8
