	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AEFA8
sub_080AEFA8: @ 0x080AEFA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r1, #0
	movs r1, #0xd
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #1
	ldr r0, _080AF020 @ =0x0000FFFF
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _080AF0E0
	cmp r4, #0
	beq _080AF040
	movs r3, #1
	ldr r2, [sp, #8]
	lsls r2, r2, #9
	str r2, [sp, #0x14]
	ldr r0, _080AF024 @ =0x02022860
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r6, _080AF028 @ =0x0000021E
	adds r5, r0, r6
	adds r1, r4, r1
	lsls r2, r7, #5
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r1, #2
	subs r6, #0x1c
	adds r2, r2, r6
	adds r2, r2, r0
_080AF016:
	adds r0, r3, r4
	cmp r0, #0xf
	ble _080AF02C
	ldrh r0, [r5]
	b _080AF02E
	.align 2, 0
_080AF020: .4byte 0x0000FFFF
_080AF024: .4byte 0x02022860
_080AF028: .4byte 0x0000021E
_080AF02C:
	ldrh r0, [r1]
_080AF02E:
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #0xf
	ble _080AF016
	bl EnablePalSync
	b _080AF048
_080AF040:
	movs r7, #0xe
	ldr r0, [sp, #8]
	lsls r0, r0, #9
	str r0, [sp, #0x14]
_080AF048:
	mov r1, sb
	cmp r1, #7
	bhi _080AF052
	movs r2, #8
	mov sb, r2
_080AF052:
	mov r3, sl
	cmp r3, #7
	bhi _080AF05C
	movs r6, #8
	mov sl, r6
_080AF05C:
	ldr r4, _080AF0F0 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080AF0F4 @ =0x000001FF
	ldr r3, [sp, #0xc]
	ands r3, r0
	ldr r6, [sp, #0x14]
	adds r1, r3, r6
	ldr r2, [sp, #0x10]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, _080AF0F8 @ =0x08CE5EB6
	movs r0, #0xf
	ands r7, r0
	lsls r0, r7, #0xc
	ldr r6, [sp, #4]
	adds r0, r6, r0
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080AF0E0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF0F0: .4byte 0x080C5A48
_080AF0F4: .4byte 0x000001FF
_080AF0F8: .4byte 0x08CE5EB6
