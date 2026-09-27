	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxTryRelocateRight
HelpBoxTryRelocateRight: @ 0x08081F14
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _08081F24
	movs r0, #0
	b _08081F3E
_08081F24:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081F3C
	adds r0, r2, #0
	bl _call_via_r1
_08081F3C:
	movs r0, #1
_08081F3E:
	pop {r1}
	bx r1
	.align 2, 0
