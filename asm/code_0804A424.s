	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMenu
EndMenu: @ 0x0804A424
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r5, r4, #0
	adds r5, #0x63
	movs r0, #4
	ldrb r2, [r5]
	orrs r0, r2
	strb r0, [r5]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804A450
	adds r0, r4, #0
	bl _call_via_r2
_0804A450:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0804A45E
	adds r0, r4, #0
	bl _call_via_r1
_0804A45E:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0804A46C
	bl UnlockGame
_0804A46C:
	adds r0, r4, #0
	bl Proc_End
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #0x14]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
