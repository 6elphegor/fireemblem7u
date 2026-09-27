	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054F30
sub_08054F30: @ 0x08054F30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _08054F98 @ =0x08FC0008
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08054F6E
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_08054F6E:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08054F84
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
_08054F84:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _08054F9C
	cmp r0, #1
	bge _08054FAA
	cmp r0, #0
	beq _08054FA0
	b _08054FAA
	.align 2, 0
_08054F98: .4byte 0x08FC0008
_08054F9C:
	cmp r0, #4
	bne _08054FAA
_08054FA0:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _08054FB8
_08054FAA:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_08054FB8:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0805503C
	cmp r4, r0
	blt _0805509C
	cmp r4, #3
	bgt _0805509C
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _08055038 @ =0x02022860
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl sub_08055320
	b _0805509C
	.align 2, 0
_08055038: .4byte 0x02022860
_0805503C:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805506A
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _080550B4 @ =0x02022A60
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_0805506A:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08055098
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _080550B4 @ =0x02022A60
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
_08055098:
	bl EnablePalSync
_0805509C:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _080550AA
	b _080552CA
_080550AA:
	lsls r0, r0, #2
	ldr r1, _080550B8 @ =_080550BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080550B4: .4byte 0x02022A60
_080550B8: .4byte _080550BC
_080550BC: @ jump table
	.4byte _080550F0 @ case 0
	.4byte _080550D0 @ case 1
	.4byte _080550D8 @ case 2
	.4byte _080550E0 @ case 3
	.4byte _080550E8 @ case 4
_080550D0:
	movs r0, #1
	bl EnableBgSync
	b _080552CA
_080550D8:
	movs r0, #2
	bl EnableBgSync
	b _080552CA
_080550E0:
	movs r0, #4
	bl EnableBgSync
	b _080552CA
_080550E8:
	movs r0, #8
	bl EnableBgSync
	b _080552CA
_080550F0:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _080551DE
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _080551DE
	lsls r0, r0, #2
	ldr r1, _08055114 @ =_08055118
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055114: .4byte _08055118
_08055118: @ jump table
	.4byte _0805512C @ case 0
	.4byte _08055158 @ case 1
	.4byte _08055184 @ case 2
	.4byte _080551B0 @ case 3
	.4byte _0805512C @ case 4
_0805512C:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055154 @ =0x08B9CC84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _080551D4
	.align 2, 0
_08055154: .4byte 0x08B9CC84
_08055158:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055180 @ =0x08B9CB84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _080551D4
	.align 2, 0
_08055180: .4byte 0x08B9CB84
_08055184:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080551AC @ =0x08B9CB84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _080551D4
	.align 2, 0
_080551AC: .4byte 0x08B9CB84
_080551B0:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080551FC @ =0x08B9CC84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_080551D4:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_080551DE:
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080552CA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _080552CA
	lsls r0, r0, #2
	ldr r1, _08055200 @ =_08055204
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080551FC: .4byte 0x08B9CC84
_08055200: .4byte _08055204
_08055204: @ jump table
	.4byte _08055218 @ case 0
	.4byte _08055244 @ case 1
	.4byte _08055270 @ case 2
	.4byte _0805529C @ case 3
	.4byte _08055218 @ case 4
_08055218:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055240 @ =0x08B9CC04
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _080552C0
	.align 2, 0
_08055240: .4byte 0x08B9CC04
_08055244:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805526C @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _080552C0
	.align 2, 0
_0805526C: .4byte 0x08B9CAF8
_08055270:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055298 @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _080552C0
	.align 2, 0
_08055298: .4byte 0x08B9CAF8
_0805529C:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080552D8 @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_080552C0:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_080552CA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080552D8: .4byte 0x08B9CAF8
