	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3124
sub_080B3124: @ 0x080B3124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp sb, r3
	ble _080B3146
	adds r1, r3, #0
_080B3146:
	ldr r0, [sp, #0x44]
	cmp r1, r0
	ble _080B314E
	adds r1, r0, #0
_080B314E:
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	ble _080B3156
	adds r1, r0, #0
_080B3156:
	mov r7, sb
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bge _080B3160
	adds r7, r0, #0
_080B3160:
	ldr r0, [sp, #0x44]
	cmp r7, r0
	bge _080B3168
	adds r7, r0, #0
_080B3168:
	ldr r0, [sp, #0x4c]
	cmp r7, r0
	bge _080B3170
	adds r7, r0, #0
_080B3170:
	mov r8, sl
	ldr r0, [sp, #0x10]
	cmp sl, r0
	ble _080B317A
	mov r8, r0
_080B317A:
	ldr r0, [sp, #0x40]
	cmp r8, r0
	ble _080B3182
	mov r8, r0
_080B3182:
	ldr r0, [sp, #0x48]
	cmp r8, r0
	ble _080B318A
	mov r8, r0
_080B318A:
	mov r6, sl
	ldr r0, [sp, #0x10]
	cmp r6, r0
	bge _080B3194
	adds r6, r0, #0
_080B3194:
	ldr r0, [sp, #0x40]
	cmp r6, r0
	bge _080B319C
	adds r6, r0, #0
_080B319C:
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bge _080B31A4
	adds r6, r0, #0
_080B31A4:
	adds r5, r1, #0
	cmp r5, r7
	bgt _080B321A
_080B31AA:
	mov r4, r8
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	cmp r4, r6
	bgt _080B3214
_080B31B4:
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl IsPointInQuad
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B31E2
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_080B3070
	b _080B320E
_080B31E2:
	ldr r0, [sp, #0x40]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	str r0, [sp, #8]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl IsPointInQuad
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B320E
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_080B3070
_080B320E:
	adds r4, #1
	cmp r4, r6
	ble _080B31B4
_080B3214:
	ldr r5, [sp, #0x1c]
	cmp r5, r7
	ble _080B31AA
_080B321A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
