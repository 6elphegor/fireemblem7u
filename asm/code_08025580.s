	.include "macro.inc"

	.syntax unified

	thumb_func_start ForceSyncUnitSpriteSheet
ForceSyncUnitSpriteSheet: @ 0x08025580
	push {lr}
	ldr r0, _080255A0 @ =0x0203A3D0
	movs r1, #0
	str r1, [r0]
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _080255AC
	cmp r0, #0x23
	ble _080255A8
	ldr r0, _080255A4 @ =0x02037F14
	b _080255AE
	.align 2, 0
_080255A0: .4byte 0x0203A3D0
_080255A4: .4byte 0x02037F14
_080255A8:
	cmp r0, #0x1f
	ble _080255C4
_080255AC:
	ldr r0, _080255BC @ =0x02035F14
_080255AE:
	ldr r1, _080255C0 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	b _080255D4
	.align 2, 0
_080255BC: .4byte 0x02035F14
_080255C0: .4byte 0x06011000
_080255C4:
	cmp r1, #0
	blt _080255D4
	ldr r0, _080255D8 @ =0x02033F14
	ldr r1, _080255DC @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
_080255D4:
	pop {r0}
	bx r0
	.align 2, 0
_080255D8: .4byte 0x02033F14
_080255DC: .4byte 0x06011000
