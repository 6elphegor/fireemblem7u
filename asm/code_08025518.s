	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncUnitSpriteSheet
SyncUnitSpriteSheet: @ 0x08025518
	push {r4, r5, lr}
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _08025538
	ldr r0, _08025570 @ =0x02033F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025538:
	cmp r4, #0x20
	bne _08025548
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025548:
	cmp r4, #0x24
	bne _08025558
	ldr r0, _0802557C @ =0x02037F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025558:
	cmp r5, #0x44
	bne _08025568
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025568:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025570: .4byte 0x02033F14
_08025574: .4byte 0x06011000
_08025578: .4byte 0x02035F14
_0802557C: .4byte 0x02037F14
