	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncDispIo
SyncDispIo: @ 0x080011B0
	push {r7, lr}
	mov r7, sp
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldr r1, _08001284 @ =0x03002870
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001288 @ =0x04000004
	ldr r1, _0800128C @ =0x03002874
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001290 @ =0x04000008
	ldr r1, _08001294 @ =0x0300287C
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001298 @ =0x0400000A
	ldr r1, _0800129C @ =0x03002880
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012A0 @ =0x0400000C
	ldr r1, _080012A4 @ =0x03002884
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012A8 @ =0x0400000E
	ldr r1, _080012AC @ =0x03002888
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012B0 @ =0x04000010
	ldr r1, _080012B4 @ =0x0300288C
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012B8 @ =0x04000014
	ldr r1, _080012BC @ =0x03002890
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012C0 @ =0x04000018
	ldr r1, _080012C4 @ =0x03002894
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012C8 @ =0x0400001C
	ldr r1, _080012CC @ =0x03002898
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012D0 @ =0x04000040
	ldr r1, _080012D4 @ =0x0300289C
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012D8 @ =0x04000044
	ldr r1, _080012DC @ =0x030028A0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012E0 @ =0x04000048
	ldr r1, _080012E4 @ =0x030028A4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _080012E8 @ =0x0400004C
	ldr r1, _080012EC @ =0x030028A8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012F0 @ =0x04000050
	ldr r1, _080012F4 @ =0x030028AC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080012F8 @ =0x04000052
	ldr r1, _080012FC @ =0x030028B4
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08001300 @ =0x04000054
	ldr r1, _08001304 @ =0x030028B6
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001308 @ =0x04000020
	ldr r1, _0800130C @ =0x030028B8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001310 @ =0x04000024
	ldr r1, _08001314 @ =0x030028BC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001318 @ =0x04000028
	ldr r1, _0800131C @ =0x030028C0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001320 @ =0x0400002C
	ldr r1, _08001324 @ =0x030028C4
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001328 @ =0x04000030
	ldr r1, _0800132C @ =0x030028C8
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001330 @ =0x04000034
	ldr r1, _08001334 @ =0x030028CC
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001338 @ =0x04000038
	ldr r1, _0800133C @ =0x030028D0
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _08001340 @ =0x0400003C
	ldr r1, _08001344 @ =0x030028D4
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001284: .4byte 0x03002870
_08001288: .4byte 0x04000004
_0800128C: .4byte 0x03002874
_08001290: .4byte 0x04000008
_08001294: .4byte 0x0300287C
_08001298: .4byte 0x0400000A
_0800129C: .4byte 0x03002880
_080012A0: .4byte 0x0400000C
_080012A4: .4byte 0x03002884
_080012A8: .4byte 0x0400000E
_080012AC: .4byte 0x03002888
_080012B0: .4byte 0x04000010
_080012B4: .4byte 0x0300288C
_080012B8: .4byte 0x04000014
_080012BC: .4byte 0x03002890
_080012C0: .4byte 0x04000018
_080012C4: .4byte 0x03002894
_080012C8: .4byte 0x0400001C
_080012CC: .4byte 0x03002898
_080012D0: .4byte 0x04000040
_080012D4: .4byte 0x0300289C
_080012D8: .4byte 0x04000044
_080012DC: .4byte 0x030028A0
_080012E0: .4byte 0x04000048
_080012E4: .4byte 0x030028A4
_080012E8: .4byte 0x0400004C
_080012EC: .4byte 0x030028A8
_080012F0: .4byte 0x04000050
_080012F4: .4byte 0x030028AC
_080012F8: .4byte 0x04000052
_080012FC: .4byte 0x030028B4
_08001300: .4byte 0x04000054
_08001304: .4byte 0x030028B6
_08001308: .4byte 0x04000020
_0800130C: .4byte 0x030028B8
_08001310: .4byte 0x04000024
_08001314: .4byte 0x030028BC
_08001318: .4byte 0x04000028
_0800131C: .4byte 0x030028C0
_08001320: .4byte 0x0400002C
_08001324: .4byte 0x030028C4
_08001328: .4byte 0x04000030
_0800132C: .4byte 0x030028C8
_08001330: .4byte 0x04000034
_08001334: .4byte 0x030028CC
_08001338: .4byte 0x04000038
_0800133C: .4byte 0x030028D0
_08001340: .4byte 0x0400003C
_08001344: .4byte 0x030028D4
