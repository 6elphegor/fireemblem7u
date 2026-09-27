	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshTerrainMap
RefreshTerrainMap: @ 0x0801932C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _080193AC @ =0x0202E3D8
	mov sb, r0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0801939A
	mov r8, sb
	ldr r3, _080193B0 @ =0x08B932B4
	mov sl, r3
_0801934A:
	movs r3, #0
	mov r4, r8
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r6, r1, #1
	cmp r3, r0
	bge _0801938E
	ldr r4, _080193B4 @ =0x0202E3E0
	mov ip, r4
	lsls r4, r1, #2
	ldr r5, _080193B8 @ =0x08B932B0
	mov r7, sl
_08019362:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _08019362
_0801938E:
	adds r1, r6, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _0801934A
_0801939A:
	bl RefreshAllLightRunes
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080193AC: .4byte 0x0202E3D8
_080193B0: .4byte 0x08B932B4
_080193B4: .4byte 0x0202E3E0
_080193B8: .4byte 0x08B932B0
