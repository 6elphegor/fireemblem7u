	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E348
sub_0807E348: @ 0x0807E348
	push {r4, r5, lr}
	ldr r5, _0807E3A4 @ =0x08CE09B8
	ldr r0, _0807E3A8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_0807E358:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E38E
	ldr r0, [r2]
	cmp r0, #0
	beq _0807E38E
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	beq _0807E38E
	cmp r0, #0x27
	beq _0807E38E
	ldr r0, [r2, #0xc]
	ldr r1, _0807E3AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E38E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E394
_0807E38E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807E358
_0807E394:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3A4: .4byte 0x08CE09B8
_0807E3A8: .4byte 0x0202E3F4
_0807E3AC: .4byte 0x0001000C
