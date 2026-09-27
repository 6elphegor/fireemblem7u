	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A954
sub_0804A954: @ 0x0804A954
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_0804A73C
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl PutUiHand
	ldr r0, _0804A99C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804A9A4
	bl CloseHelpBox
	ldr r1, _0804A9A0 @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
	b _0804A9CA
	.align 2, 0
_0804A99C: .4byte 0x08B857F8
_0804A9A0: .4byte 0x08B9A888
_0804A9A4:
	adds r1, r5, #0
	adds r1, #0x61
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	beq _0804A9CA
	ldr r2, [r5, #0x30]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	bl _call_via_r2
_0804A9CA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
