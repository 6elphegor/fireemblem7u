	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnFunc
EvtCmd_GotoIfnFunc: @ 0x0800D590
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D5A6
	movs r0, #0
	b _0800D5B0
_0800D5A6:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D5B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
