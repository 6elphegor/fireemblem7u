	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AA68
sub_0804AA68: @ 0x0804AA68
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
	ldr r0, _0804AAA8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804AAA0
	ldr r1, _0804AAAC @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
_0804AAA0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAA8: .4byte 0x08B857F8
_0804AAAC: .4byte 0x08B9A888
