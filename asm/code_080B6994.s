	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6994
sub_080B6994: @ 0x080B6994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0
	add r0, sp, #0xc
_080B699C:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080B699C
	bl PidStatsGetTotalExpGain
	adds r1, r0, #0
	ldr r4, _080B6A64 @ =0x000FFFFF
	cmp r1, r4
	ble _080B69B2
	adds r1, r4, #0
_080B69B2:
	ldr r3, _080B6A68 @ =0x0202BBF8
	ldr r2, [r3, #0x38]
	lsls r0, r2, #4
	lsrs r0, r0, #0xc
	subs r7, r1, r0
	ands r1, r4
	lsls r1, r1, #8
	ldr r0, _080B6A6C @ =0xF00000FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x38]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r5, r0, #0
	bl IsDifficultMode
	ldr r6, _080B6A70 @ =0x08C9A200
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r4, #0x98
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #4]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #8]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x3e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B6A4C:
	ldr r0, [r1]
	cmp r7, r0
	blt _080B6A5A
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B6A4C
_080B6A5A:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6A64: .4byte 0x000FFFFF
_080B6A68: .4byte 0x0202BBF8
_080B6A6C: .4byte 0xF00000FF
_080B6A70: .4byte 0x08C9A200
