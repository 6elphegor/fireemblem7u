	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateBanimFrame
UpdateBanimFrame: @ 0x08054024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080541F4 @ =0x08E00008
	mov sb, r0
	ldr r1, _080541F8 @ =0x08FD8008
	mov sl, r1
	ldr r1, _080541FC @ =0x0201FB10
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, _08054200 @ =0x0203E010
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _080540DC
	ldr r0, _08054204 @ =0x0203E08E
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldr r0, _08054208 @ =0x0203E020
	movs r1, #0
	ldrsh r7, [r0, r1]
	ldr r0, _0805420C @ =0x0203E01C
	movs r2, #0
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	ldr r1, _080541F4 @ =0x08E00008
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08054210 @ =0x0200F1C8
	bl LZ77UnCompWram
	ldr r1, _08054214 @ =0x0200005C
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl GetBanimPalette
	lsls r0, r0, #5
	ldr r2, _080541F4 @ =0x08E00008
	adds r0, r0, r2
	ldr r0, [r0, #0x1c]
	ldr r5, _08054218 @ =0x02004088
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080540A6
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #0
	bl ApplyBanimUniquePalette
_080540A6:
	ldr r1, _0805421C @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1]
	ldr r4, _08054220 @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054224 @ =0x0203E0A8
	ldr r0, [r0]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x18]
	ldr r4, _08054228 @ =0x020041C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0805422C @ =0x000057F0
	adds r4, r4, r0
	mov r1, r8
	str r1, [r4]
_080540DC:
	ldr r0, _08054200 @ =0x0203E010
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _08054176
	ldr r0, _08054204 @ =0x0203E08E
	movs r2, #2
	ldrsh r5, [r0, r2]
	ldr r0, _08054208 @ =0x0203E020
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, _0805420C @ =0x0203E01C
	movs r2, #2
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08054230 @ =0x02011BC8
	bl LZ77UnCompWram
	ldr r1, _08054234 @ =0x02000060
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r5, _08054238 @ =0x02004128
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08054140
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #1
	bl ApplyBanimUniquePalette
_08054140:
	ldr r1, _0805421C @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r4, _0805423C @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054224 @ =0x0203E0A8
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x14]
	ldr r4, _08054240 @ =0x020099C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _0805422C @ =0x000057F0
	adds r4, r4, r2
	mov r0, r8
	str r0, [r4]
_08054176:
	ldr r6, _08054244 @ =0x0203E0A0
	ldr r2, [r6]
	cmp r2, #0
	beq _080541E4
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	lsls r0, r0, #0x10
	ldr r5, _08054224 @ =0x0203E0A8
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5]
	ldr r0, [r6]
	ldr r1, [sp]
	bl GetBattleAnimCharacterUniquePalIndex
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r4, r7
	beq _080541B4
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5]
_080541B4:
	ldr r0, [r6, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp]
	bl GetBattleAnimCharacterUniquePalIndex
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r7
	beq _080541E4
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5, #4]
_080541E4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080541F4: .4byte 0x08E00008
_080541F8: .4byte 0x08FD8008
_080541FC: .4byte 0x0201FB10
_08054200: .4byte 0x0203E010
_08054204: .4byte 0x0203E08E
_08054208: .4byte 0x0203E020
_0805420C: .4byte 0x0203E01C
_08054210: .4byte 0x0200F1C8
_08054214: .4byte 0x0200005C
_08054218: .4byte 0x02004088
_0805421C: .4byte 0x02000054
_08054220: .4byte 0x02022B40
_08054224: .4byte 0x0203E0A8
_08054228: .4byte 0x020041C8
_0805422C: .4byte 0x000057F0
_08054230: .4byte 0x02011BC8
_08054234: .4byte 0x02000060
_08054238: .4byte 0x02004128
_0805423C: .4byte 0x02022B80
_08054240: .4byte 0x020099C8
_08054244: .4byte 0x0203E0A0
