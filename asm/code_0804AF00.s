	.include "macro.inc"

	.syntax unified

	thumb_func_start EndTargetSelection
EndTargetSelection: @ 0x0804AF00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0804AF12
	adds r0, r4, #0
	bl _call_via_r1
_0804AF12:
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804AF24
	bl UnlockGame
_0804AF24:
	adds r0, r4, #0
	bl Proc_End
	ldr r0, [r4, #0x14]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
