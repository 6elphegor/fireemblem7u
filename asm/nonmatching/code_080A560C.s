	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A560C
sub_080A560C: @ 0x080A560C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r1, [r4]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A5636
	ldrb r0, [r0]
	bl SaveMenuInitSlotPalette
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080A5636:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_080A652C
	ldr r2, _080A5684 @ =0x02022860
	ldr r3, _080A5688 @ =0x02000004
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080A572A
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A572A
	cmp r1, #0xf
	bhi _080A568C
	movs r0, #0xff
	strb r0, [r4]
	b _080A5720
	.align 2, 0
_080A5684: .4byte 0x02022860
_080A5688: .4byte 0x02000004
_080A568C:
	ldr r0, _080A5744 @ =0x080C5A48
	mov sb, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
_080A5720:
	ldr r0, [r7, #0x14]
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
_080A572A:
	ldrh r0, [r7, #0x2a]
	bl sub_080A5148
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5744: .4byte 0x080C5A48
