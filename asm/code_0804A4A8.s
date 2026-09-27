	.include "macro.inc"

	.syntax unified

	thumb_func_start Menu_OnInit
Menu_OnInit: @ 0x0804A4A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0804A4BA
	adds r0, r4, #0
	bl _call_via_r1
_0804A4BA:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804A4D8
	adds r0, r4, #0
	bl _call_via_r2
_0804A4D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
