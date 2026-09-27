	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkMoreGeneric
EvtCmd_TalkMoreGeneric: @ 0x0800BB7C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BBBC
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BBBC
	ldr r0, _0800BBB8 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	movs r0, #2
	b _0800BBBE
	.align 2, 0
_0800BBB8: .4byte 0x03004690
_0800BBBC:
	movs r0, #0
_0800BBBE:
	pop {r1}
	bx r1
	.align 2, 0
