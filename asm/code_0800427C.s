	.include "macro.inc"

	.syntax unified

	thumb_func_start InitRamFuncs
InitRamFuncs: @ 0x0800427C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080042FC @ =0x080009FC
	ldr r1, _08004300 @ =_08000228
	subs r0, r0, r1
	str r0, [r7]
	ldr r0, _08004300 @ =_08000228
	ldr r1, _08004304 @ =0x03002F40
	ldr r2, [r7]
	asrs r3, r2, #0x1f
	lsrs r4, r3, #0x1f
	adds r3, r2, r4
	asrs r2, r3, #1
	lsls r3, r2, #0xb
	lsrs r2, r3, #0xb
	bl CpuSet
	ldr r0, _08004308 @ =0x03002F30
	ldr r1, _0800430C @ =DrawGlyph
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004310 @ =0x03003940
	ldr r1, _08004314 @ =DecodeString
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004318 @ =0x03002920
	ldr r1, _0800431C @ =PutOamHi
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004320 @ =0x03003944
	ldr r1, _08004324 @ =PutOamLo
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004328 @ =0x03004150
	ldr r1, _0800432C @ =MapFloodCoreStep
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _08004330 @ =0x03002918
	ldr r1, _08004334 @ =MapFloodCore
	ldr r2, _08004300 @ =_08000228
	subs r1, r1, r2
	ldr r2, _08004304 @ =0x03002F40
	adds r1, r2, r1
	str r1, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042FC: .4byte 0x080009FC
_08004300: .4byte _08000228
_08004304: .4byte 0x03002F40
_08004308: .4byte 0x03002F30
_0800430C: .4byte DrawGlyph
_08004310: .4byte 0x03003940
_08004314: .4byte DecodeString
_08004318: .4byte 0x03002920
_0800431C: .4byte PutOamHi
_08004320: .4byte 0x03003944
_08004324: .4byte PutOamLo
_08004328: .4byte 0x03004150
_0800432C: .4byte MapFloodCoreStep
_08004330: .4byte 0x03002918
_08004334: .4byte MapFloodCore
