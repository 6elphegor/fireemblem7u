	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateUnitCompleteStaffRange
GenerateUnitCompleteStaffRange: @ 0x0801AE10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl GetUnitStaffReachBits
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagRange
	adds r2, r0, #0
	cmp r5, #3
	beq _0801AED0
	cmp r5, #3
	bgt _0801AE38
	cmp r5, #1
	beq _0801AE40
	b _0801AFEA
_0801AE38:
	cmp r5, #0x20
	bne _0801AE3E
	b _0801AF60
_0801AE3E:
	b _0801AFEA
_0801AE40:
	ldr r0, _0801AEC0 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801AE4E
	b _0801AFEA
_0801AE4E:
	ldr r0, _0801AEC0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AEB8
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801AE64:
	ldr r0, _0801AEC4 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AEB2
	ldr r0, _0801AEC8 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB2
	ldr r0, _0801AECC @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB2
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AEB2:
	subs r5, #1
	cmp r5, #0
	bge _0801AE64
_0801AEB8:
	mov r1, r8
	cmp r1, #0
	bge _0801AE4E
	b _0801AFEA
	.align 2, 0
_0801AEC0: .4byte 0x0202E3D8
_0801AEC4: .4byte 0x0202E3E4
_0801AEC8: .4byte 0x0202E3DC
_0801AECC: .4byte 0x0202E3F4
_0801AED0:
	ldr r0, _0801AF50 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801AEDE
	b _0801AFEA
_0801AEDE:
	ldr r0, _0801AF50 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AF48
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801AEF4:
	ldr r0, _0801AF54 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF42
	ldr r0, _0801AF58 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF42
	ldr r0, _0801AF5C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF42
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AF42:
	subs r5, #1
	cmp r5, #0
	bge _0801AEF4
_0801AF48:
	mov r1, r8
	cmp r1, #0
	bge _0801AEDE
	b _0801AFEA
	.align 2, 0
_0801AF50: .4byte 0x0202E3D8
_0801AF54: .4byte 0x0202E3E4
_0801AF58: .4byte 0x0202E3DC
_0801AF5C: .4byte 0x0202E3F4
_0801AF60:
	ldr r0, _0801AFF8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801AFEA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801AF72:
	ldr r0, _0801AFF8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AFE4
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov sb, r0
_0801AF8E:
	ldr r0, _0801AFFC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AFDE
	ldr r0, _0801B000 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFDE
	ldr r0, _0801B004 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFDE
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, sb
	asrs r2, r3, #0x10
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AFDE:
	subs r5, #1
	cmp r5, #0
	bge _0801AF8E
_0801AFE4:
	mov r1, r8
	cmp r1, #0
	bge _0801AF72
_0801AFEA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AFF8: .4byte 0x0202E3D8
_0801AFFC: .4byte 0x0202E3E4
_0801B000: .4byte 0x0202E3DC
_0801B004: .4byte 0x0202E3F4
