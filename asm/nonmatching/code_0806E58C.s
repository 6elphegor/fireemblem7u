	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_PrepareNextBattleRound
Manim_PrepareNextBattleRound: @ 0x0806E58C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E5B8 @ =0x0203E0FC
	ldr r1, [r0, #0x50]
	ldrb r0, [r1, #2]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E5C0
	ldr r0, [r7]
	bl Proc_Break
	ldr r1, _0806E5BC @ =0x08C9D6DC
	ldr r0, [r7]
	bl Proc_GotoScript
	b _0806E5CA
	.align 2, 0
_0806E5B8: .4byte 0x0203E0FC
_0806E5BC: .4byte 0x08C9D6DC
_0806E5C0:
	bl Manim_AdvanceBattleRound
	ldr r0, [r7]
	bl Proc_Break
_0806E5CA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
