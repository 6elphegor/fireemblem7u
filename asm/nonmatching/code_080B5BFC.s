	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5BFC
sub_080B5BFC: @ 0x080B5BFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	str r3, [sp]
	cmp r0, #0
	bge _080B5C3A
	cmp r7, #0
	bge _080B5C3A
	movs r5, #0
_080B5C1A:
	movs r4, #0
	ldr r0, [sp]
	adds r7, r0, r5
	adds r6, r5, #1
_080B5C22:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r7, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5C22
	adds r5, r6, #0
	cmp r5, #0x14
	ble _080B5C1A
	b _080B5D2E
_080B5C3A:
	ldr r0, [sp]
	cmp r0, r7
	bge _080B5CB0
	adds r5, r0, #0
	movs r1, #0x15
	adds r1, r1, r5
	mov sl, r1
_080B5C48:
	movs r4, #0
	adds r6, r5, #1
_080B5C4C:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5C4C
	adds r5, r6, #0
	cmp r5, r7
	blt _080B5C48
	adds r5, r7, #0
	cmp r5, sl
	bge _080B5C84
_080B5C68:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B5C7E
_080B5C70:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, sb
	blt _080B5C70
_080B5C7E:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5C68
_080B5C84:
	adds r5, r7, #0
	cmp r5, sl
	bge _080B5D2E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B5C90:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B5CA8
_080B5C9A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, r7
	blt _080B5C9A
_080B5CA8:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5C90
	b _080B5D2E
_080B5CB0:
	adds r5, r7, #0
	adds r5, #0x15
	ldr r0, [sp]
	adds r0, #0x15
	mov sl, r0
	str r5, [sp, #4]
	cmp r5, sl
	bge _080B5CDA
_080B5CC0:
	movs r4, #0
	adds r6, r5, #1
_080B5CC4:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5CC4
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5CC0
_080B5CDA:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B5D00
_080B5CE2:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B5CF8
_080B5CEA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, sb
	blt _080B5CEA
_080B5CF8:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B5CE2
_080B5D00:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B5D2E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B5D0E:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B5D26
_080B5D18:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, r7
	blt _080B5D18
_080B5D26:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B5D0E
_080B5D2E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
