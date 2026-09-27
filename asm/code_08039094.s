	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08039094
sub_08039094: @ 0x08039094
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _08039124 @ =0x08B989FC
	ldrb r2, [r4]
	cmp r2, #0x7f
	beq _08039108
	ldr r0, _08039128 @ =0x0203A3F0
	mov sb, r0
	ldr r1, _0803912C @ =0x0202E3D8
	mov r8, r1
_080390AE:
	mov r3, sb
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r6, sb
	ldrb r6, [r6, #0x11]
	ldrb r7, [r4, #1]
	adds r0, r6, r7
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08039130 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r6, r8
	movs r7, #0
	ldrsh r0, [r6, r7]
	cmp r2, r0
	bge _08039100
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _08039100
	cmp r1, #0
	beq _08039100
	mov r3, sb
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039100
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_08039100:
	adds r4, #4
	ldrb r2, [r4]
	cmp r2, #0x7f
	bne _080390AE
_08039108:
	ldr r0, _08039134 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _08039116
	movs r5, #0xa
_08039116:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039124: .4byte 0x08B989FC
_08039128: .4byte 0x0203A3F0
_0803912C: .4byte 0x0202E3D8
_08039130: .4byte 0x0202E3DC
_08039134: .4byte 0x030013C0
