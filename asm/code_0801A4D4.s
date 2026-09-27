	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateUnitCompleteAttackRange
GenerateUnitCompleteAttackRange: @ 0x0801A4D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	bl GetUnitWeaponReach
	subs r0, #1
	cmp r0, #0xe
	bls _0801A4F2
	b _0801AB72
_0801A4F2:
	lsls r0, r0, #2
	ldr r1, _0801A4FC @ =_0801A500
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A4FC: .4byte _0801A500
_0801A500: @ jump table
	.4byte _0801A53C @ case 0
	.4byte _0801A710 @ case 1
	.4byte _0801A5D8 @ case 2
	.4byte _0801A848 @ case 3
	.4byte _0801A980 @ case 4
	.4byte _0801A7AC @ case 5
	.4byte _0801A674 @ case 6
	.4byte _0801AB72 @ case 7
	.4byte _0801AB72 @ case 8
	.4byte _0801AB72 @ case 9
	.4byte _0801AB72 @ case 10
	.4byte _0801A8E4 @ case 11
	.4byte _0801AA34 @ case 12
	.4byte _0801AB72 @ case 13
	.4byte _0801AAEC @ case 14
_0801A53C:
	ldr r0, _0801A5C8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A54A
	b _0801AB72
_0801A54A:
	ldr r0, _0801A5C8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A5C0
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A564:
	ldr r0, _0801A5CC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A5B4
	ldr r0, _0801A5D0 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A5B4
	ldr r0, _0801A5D4 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A5B4
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A5B4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A564
_0801A5C0:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A54A
	b _0801AB72
	.align 2, 0
_0801A5C8: .4byte 0x0202E3D8
_0801A5CC: .4byte 0x0202E3E4
_0801A5D0: .4byte 0x0202E3DC
_0801A5D4: .4byte 0x0202E3F4
_0801A5D8:
	ldr r0, _0801A664 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A5E6
	b _0801AB72
_0801A5E6:
	ldr r0, _0801A664 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A65A
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A5FE:
	ldr r0, _0801A668 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A64E
	ldr r0, _0801A66C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A64E
	ldr r0, _0801A670 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A64E
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A64E:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A5FE
_0801A65A:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A5E6
	b _0801AB72
	.align 2, 0
_0801A664: .4byte 0x0202E3D8
_0801A668: .4byte 0x0202E3E4
_0801A66C: .4byte 0x0202E3DC
_0801A670: .4byte 0x0202E3F4
_0801A674:
	ldr r0, _0801A700 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A682
	b _0801AB72
_0801A682:
	ldr r0, _0801A700 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A6F8
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A69C:
	ldr r0, _0801A704 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A6EC
	ldr r0, _0801A708 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A6EC
	ldr r0, _0801A70C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A6EC
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A6EC:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A69C
_0801A6F8:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A682
	b _0801AB72
	.align 2, 0
_0801A700: .4byte 0x0202E3D8
_0801A704: .4byte 0x0202E3E4
_0801A708: .4byte 0x0202E3DC
_0801A70C: .4byte 0x0202E3F4
_0801A710:
	ldr r0, _0801A79C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A71E
	b _0801AB72
_0801A71E:
	ldr r0, _0801A79C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A792
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A736:
	ldr r0, _0801A7A0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A786
	ldr r0, _0801A7A4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A786
	ldr r0, _0801A7A8 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A786
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A786:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A736
_0801A792:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A71E
	b _0801AB72
	.align 2, 0
_0801A79C: .4byte 0x0202E3D8
_0801A7A0: .4byte 0x0202E3E4
_0801A7A4: .4byte 0x0202E3DC
_0801A7A8: .4byte 0x0202E3F4
_0801A7AC:
	ldr r0, _0801A838 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A7BA
	b _0801AB72
_0801A7BA:
	ldr r0, _0801A838 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A830
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A7D4:
	ldr r0, _0801A83C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A824
	ldr r0, _0801A840 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A824
	ldr r0, _0801A844 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A824
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A824:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A7D4
_0801A830:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A7BA
	b _0801AB72
	.align 2, 0
_0801A838: .4byte 0x0202E3D8
_0801A83C: .4byte 0x0202E3E4
_0801A840: .4byte 0x0202E3DC
_0801A844: .4byte 0x0202E3F4
_0801A848:
	ldr r0, _0801A8D4 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A856
	b _0801AB72
_0801A856:
	ldr r0, _0801A8D4 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A8CA
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A86E:
	ldr r0, _0801A8D8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A8BE
	ldr r0, _0801A8DC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A8BE
	ldr r0, _0801A8E0 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A8BE
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A8BE:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A86E
_0801A8CA:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A856
	b _0801AB72
	.align 2, 0
_0801A8D4: .4byte 0x0202E3D8
_0801A8D8: .4byte 0x0202E3E4
_0801A8DC: .4byte 0x0202E3DC
_0801A8E0: .4byte 0x0202E3F4
_0801A8E4:
	ldr r0, _0801A970 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A8F2
	b _0801AB72
_0801A8F2:
	ldr r0, _0801A970 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A968
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A90C:
	ldr r0, _0801A974 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A95C
	ldr r0, _0801A978 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A95C
	ldr r0, _0801A97C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A95C
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801A95C:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A90C
_0801A968:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A8F2
	b _0801AB72
	.align 2, 0
_0801A970: .4byte 0x0202E3D8
_0801A974: .4byte 0x0202E3E4
_0801A978: .4byte 0x0202E3DC
_0801A97C: .4byte 0x0202E3F4
_0801A980:
	ldr r0, _0801AA24 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A98E
	b _0801AB72
_0801A98E:
	ldr r0, _0801AA24 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AA1C
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801A9A6:
	ldr r0, _0801AA28 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AA10
	ldr r0, _0801AA2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA10
	ldr r0, _0801AA30 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA10
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AA10:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A9A6
_0801AA1C:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A98E
	b _0801AB72
	.align 2, 0
_0801AA24: .4byte 0x0202E3D8
_0801AA28: .4byte 0x0202E3E4
_0801AA2C: .4byte 0x0202E3DC
_0801AA30: .4byte 0x0202E3F4
_0801AA34:
	ldr r0, _0801AADC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AA42
	b _0801AB72
_0801AA42:
	ldr r0, _0801AADC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AAD2
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AA5C:
	ldr r0, _0801AAE0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AAC6
	ldr r0, _0801AAE4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AAC6
	ldr r0, _0801AAE8 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AAC6
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AAC6:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801AA5C
_0801AAD2:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AA42
	b _0801AB72
	.align 2, 0
_0801AADC: .4byte 0x0202E3D8
_0801AAE0: .4byte 0x0202E3E4
_0801AAE4: .4byte 0x0202E3DC
_0801AAE8: .4byte 0x0202E3F4
_0801AAEC:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801AB72
_0801AAF8:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AB6C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AB10:
	ldr r0, _0801AC50 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AB60
	ldr r0, _0801AC54 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB60
	ldr r0, _0801AC58 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB60
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AB60:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AB10
_0801AB6C:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AAF8
_0801AB72:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801AC34
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801AC34
_0801AB92:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AC2E
	lsls r0, r6, #2
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801ABAE:
	ldr r0, _0801AC50 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AC22
	ldr r0, _0801AC54 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	ldr r0, _0801AC58 @ =0x0202E3F4
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	mov r0, r8
	adds r1, r6, #0
	bl GetBallistaItemAt
	adds r7, r0, #0
	cmp r7, #0
	beq _0801AC22
	mov r1, r8
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, sl
	movs r3, #1
	bl MapAddInRange
	subs r4, #1
	adds r0, r5, #0
	mov r1, sl
	adds r2, r4, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AC22:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r0, r8
	cmp r0, #0
	bge _0801ABAE
_0801AC2E:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AB92
_0801AC34:
	ldr r2, _0801AC50 @ =0x0202E3E4
	ldr r1, [r2]
	ldr r0, _0801AC5C @ =0x030041E0
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AC4C: .4byte 0x0202E3D8
_0801AC50: .4byte 0x0202E3E4
_0801AC54: .4byte 0x0202E3DC
_0801AC58: .4byte 0x0202E3F4
_0801AC5C: .4byte 0x030041E0
