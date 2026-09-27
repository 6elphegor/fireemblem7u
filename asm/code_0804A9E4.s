	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A9E4
sub_0804A9E4: @ 0x0804A9E4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	ldr r0, _0804AA2C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804AA22
	bl CloseHelpBox
	ldr r1, _0804AA30 @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
_0804AA22:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA2C: .4byte 0x08B857F8
_0804AA30: .4byte 0x08B9A888
