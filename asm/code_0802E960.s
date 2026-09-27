	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadPlayerUnitsFromUnitStack2
LoadPlayerUnitsFromUnitStack2: @ 0x0802E960
	push {r4, r5, lr}
	ldr r5, _0802E994 @ =0x0202BD50
	movs r4, #0x3d
_0802E966:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0802E966
	ldr r0, _0802E998 @ =0x0203A7E8
	ldr r0, [r0]
	ldr r1, _0802E994 @ =0x0202BD50
	ldr r2, _0802E99C @ =0x0203A7EC
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E994: .4byte 0x0202BD50
_0802E998: .4byte 0x0203A7E8
_0802E99C: .4byte 0x0203A7EC
