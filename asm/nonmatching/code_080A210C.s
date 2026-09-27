	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapWaterKindAt
GetMinimapWaterKindAt: @ 0x080A210C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A219C @ =0x0202E3E0
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A2142
	movs r4, #1
_080A2142:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A215C
	adds r4, #1
_080A215C:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A2174
	adds r4, #1
_080A2174:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A218E
	adds r4, #1
_080A218E:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A219C: .4byte 0x0202E3E0
