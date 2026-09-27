	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMapCursor
PutMapCursor: @ 0x0801596C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	mov r8, r0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	cmp r5, #4
	bhi _08015A26
	lsls r0, r5, #2
	ldr r1, _0801599C @ =_080159A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801599C: .4byte _080159A0
_080159A0: @ jump table
	.4byte _080159B4 @ case 0
	.4byte _080159B4 @ case 1
	.4byte _080159C4 @ case 2
	.4byte _08015A0C @ case 3
	.4byte _08015A1C @ case 4
_080159B4:
	movs r1, #2
	mov sb, r1
	ldr r1, _080159C0 @ =0x08B92DB0
	lsls r0, r4, #2
	adds r0, r0, r1
	b _08015A22
	.align 2, 0
_080159C0: .4byte 0x08B92DB0
_080159C4:
	bl GetGameTime
	subs r0, #1
	ldr r5, _08015A00 @ =0x0202BC44
	ldr r1, [r5]
	cmp r0, r1
	bne _080159E4
	ldr r0, _08015A04 @ =0x0202BC40
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r6, r1
	asrs r6, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r7, r0
	asrs r7, r0, #1
_080159E4:
	movs r2, #0x24
	mov sb, r2
	ldr r1, _08015A08 @ =0x08B92DB0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08015A04 @ =0x0202BC40
	strh r6, [r0]
	strh r7, [r0, #2]
	bl GetGameTime
	str r0, [r5]
	b _08015A26
	.align 2, 0
_08015A00: .4byte 0x0202BC44
_08015A04: .4byte 0x0202BC40
_08015A08: .4byte 0x08B92DB0
_08015A0C:
	movs r0, #2
	mov sb, r0
	ldr r1, _08015A18 @ =0x08B92D96
	mov r8, r1
	b _08015A26
	.align 2, 0
_08015A18: .4byte 0x08B92D96
_08015A1C:
	movs r2, #0x24
	mov sb, r2
	ldr r0, _08015A54 @ =0x08B92DB0
_08015A22:
	ldr r0, [r0]
	mov r8, r0
_08015A26:
	ldr r0, _08015A58 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r6, r6, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	mov r2, sb
	str r2, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015A54: .4byte 0x08B92DB0
_08015A58: .4byte 0x0202BBB8
