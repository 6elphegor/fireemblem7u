	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080314AC
sub_080314AC: @ 0x080314AC
	push {r4, r5, r6, r7, lr}
	movs r1, #1
	rsbs r1, r1, #0
	bl GetUnitWeaponReach
	adds r7, r0, #0
	ldr r0, _08031560 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r5, #0x81
	ldr r6, _08031564 @ =0x0203A85C
_080314C6:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080314E8
	ldr r0, [r4]
	cmp r0, #0
	beq _080314E8
	adds r0, r4, #0
	adds r1, r7, #0
	bl BuildUnitStandingRangeForReach
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #0x14]
_080314E8:
	adds r5, #1
	cmp r5, #0xbf
	ble _080314C6
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _08031568 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803155A
_08031502:
	ldr r0, _08031568 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r6, #1
	cmp r4, #0
	blt _08031554
	lsls r5, r6, #2
_08031512:
	ldr r0, _0803156C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803154E
	ldr r0, _08031570 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803154E
	ldr r0, _08031560 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803154E
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl EnlistTarget
_0803154E:
	subs r4, #1
	cmp r4, #0
	bge _08031512
_08031554:
	adds r6, r7, #0
	cmp r6, #0
	bge _08031502
_0803155A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031560: .4byte 0x0202E3F4
_08031564: .4byte 0x0203A85C
_08031568: .4byte 0x0202E3D8
_0803156C: .4byte 0x0202E3E4
_08031570: .4byte 0x0202E3DC
