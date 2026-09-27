	.include "macro.inc"

	.syntax unified

	thumb_func_start CharacterEnding_Unused_80B6C74
CharacterEnding_Unused_80B6C74: @ 0x080B85B4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r2, #0x30]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080B85CE
	adds r0, r2, #0
	movs r1, #0x64
	bl Proc_Goto
_080B85CE:
	pop {r0}
	bx r0
	.align 2, 0
